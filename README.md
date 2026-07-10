# AutoPM distribution

This repository hosts the Homebrew tap and one-line npm installer for
`@jacfrost/autopm`.

AutoPM requires Node.js 22.19.0 or newer.

## macOS/Linux npm installer

```sh
curl -fsSL https://raw.githubusercontent.com/juntaochi/homebrew-autopm/main/install.sh | bash
```

This installer runs `npm install -g @jacfrost/autopm`. Update later with:

```sh
npm install -g @jacfrost/autopm@latest
```

Re-running the installer also upgrades to the latest published npm package.

## Homebrew

```sh
brew tap juntaochi/autopm
brew install autopm
```

Update Homebrew installs with:

```sh
brew update
brew upgrade autopm
```

## Windows

Install Node.js 22.19.0 or newer, then use PowerShell:

```powershell
npm install -g @jacfrost/autopm
autopm --help
```

Update later with:

```powershell
npm install -g @jacfrost/autopm@latest
```

If `autopm` is not found after install, make sure npm's global bin directory is
on `PATH`; on most Windows npm installs this is `%AppData%\npm`.

WSL users can run the macOS/Linux installer inside WSL, but that installs AutoPM
into the WSL environment, not the Windows host.
