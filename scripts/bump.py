#!/usr/bin/env python3
"""Bump the tap's formulas to the latest huemux release.

Run by .github/workflows/auto-bump.yml (scheduled + manual), and locally
with `gh` authenticated. No-op when the formulas already match the newest
release. Uses the release's SHA256SUMS asset instead of downloading the
binaries, so a bump costs one API call and one small download.

On a change, sets TAP_BUMPED_VERSION in $GITHUB_ENV (if present) so the
workflow can write a useful commit message.
"""

import json
import os
import re
import subprocess
import sys
import urllib.request

REPO = "zamber/huemux"
FORMULAS = ["huemux.rb", "huemux-desktop.rb"]


def gh(*args):
    return subprocess.run(["gh", "api", *args], capture_output=True,
                          text=True, check=True).stdout


def main():
    releases = json.loads(gh("repos/%s/releases?per_page=5" % REPO))
    tag = releases[0]["tag_name"]
    if not tag.startswith("v"):
        sys.exit("unexpected tag from releases API: %s" % tag)
    version = tag[1:]

    changed = False
    sums = urllib.request.urlopen(
        "https://github.com/%s/releases/download/%s/SHA256SUMS" % (REPO, tag)
    ).read().decode().splitlines()
    hashes = {}
    for line in sums:
        h, name = line.split()
        hashes[name] = h

    url_re = re.compile(
        r'url "https://github\.com/%s/releases/download/v[^/]+/([^"/]+)"'
        % re.escape(REPO)
    )
    sha_re = re.compile(r'^(\s*sha256 ")[0-9a-f]{64}(")')

    for formula in FORMULAS:
        with open(formula) as f:
            text = f.read()
        cur = re.search(r'version "([^"]+)"', text)
        same_version = cur is not None and cur.group(1) == version

        # Hashes are reconciled even when the version matches: a force-pushed
        # release (tag moved to a rebuilt commit) changes the binaries under
        # the same version string, and a stale hash would break every
        # installation.
        out = []
        pending_asset = None
        for line in text.splitlines(keepends=True):
            m = url_re.search(line)
            if m:
                pending_asset = m.group(1)
                if not same_version:
                    line = line.replace("download/v" + cur.group(1), "download/" + tag)
            m2 = sha_re.match(line)
            if m2 and pending_asset:
                if pending_asset not in hashes:
                    sys.exit("%s: no SHA256SUMS entry for %s" % (formula, pending_asset))
                line = m2.group(1) + hashes[pending_asset] + m2.group(2) + "\n"
            out.append(line)

        newtext = "".join(out)
        if not same_version:
            newtext = re.sub(r'version "[^"]+"', 'version "%s"' % version, newtext, count=1)

        if newtext != text:
            with open(formula, "w") as f:
                f.write(newtext)
            changed = True
            print("%s updated to %s" % (formula, version))
        else:
            print("%s already at %s" % (formula, version))

    if changed:
        env_path = os.environ.get("GITHUB_ENV")
        if env_path:
            with open(env_path, "a") as f:
                f.write("TAP_BUMPED_VERSION=%s\n" % version)
        return 0
    print("up to date")
    return 0


if __name__ == "__main__":
    sys.exit(main())
