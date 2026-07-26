# Release checklist

- [x] Confirm the version matches in the TOC and changelog.
- [x] Confirm `LICENSE` contains the current All Rights Reserved terms.
- [x] Run Lua parsing for every addon and test file.
- [x] Run `tests/smoke.lua`.
- [x] Run `./scripts/package.sh`.
- [x] Run `unzip -t` on the generated archive.
- [x] Promote the tested beta to stable `1.1.0`.
- [ ] Install the generated archive into a clean AddOns directory.
- [ ] Confirm the compact panel opens with the guild bank.
- [ ] Confirm the displayed tab changes when selecting another tab.
- [ ] Confirm **Sort Tab**, **Stop**, and **Advanced** work.
- [ ] Confirm normal and reverse settings persist after `/reload`.
- [ ] Confirm `/gbo report` opens a copyable report.
- [ ] Capture a clean compact-panel screenshot for the CurseForge gallery.
- [ ] Capture before-and-after guild-bank screenshots.
- [ ] Upload the release ZIP with the correct MoP Classic game version.
