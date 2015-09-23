# Making the Connection
## Connecting tools and scripts to web interfaces

## Follow-along preparation

To follow along/participate you'll want to have a few things ready:

1. Apache web server turned on
2. Apache PHP5 and CGI modules enabled
3. Permissions adjusted so you can write to the various web folders
4. Munki installed (knowledge about it isn't strictly necessary)
   - An example munki repo, package and pkginfo would be helpful
5. Python virtualenv installed
6. A Python virtualenv at the ready with Flask installed

## 1. Apached turned on and configured

All versions of OS X include the Apache web server. To turn it on execute:

```bash
sudo apachectl start
```

And verify you can reach it by visiting http://127.0.0.1

If you cannot you may have another problem or issue. Check `/var/log/apache2/` directory problems in the log files.

## 2. Apache PHP5 and CGI modules enabled

By default on Yosemite CGI and PHP5 modules are disabled. We'll need those to be enabled for the demos.

- Edit `/etc/apache2/httpd.conf`. It's root-owned so you'll need to copy it, modify, and copy back with sudo, or use a text editor as e.g. root so you don't have permissions issues.
- Near the top of file there's a commented-out line beginning `#LoadModule cgi_module`. Uncomment this line by removing the # from the beginning of the line
- Also near the top of file there's a commented-out line beginning `#LoadModule php5_module`. Uncomment this line by removing the # from the beginning of the line

**Warning!** Configuration files are very strict on how they're formatted so any problems may cause the web server to not function. Beware and be careful!

Relaunch the Apache server:

```bash
sudo apachectl graceful
```

## 3. Permissions adjusted so you can write to the various web folders

Change some permissions so we can easily write to placed. This isn't strictly necessary but will help with quickly placing the files in places. In your Terminal.app:

```bash
sudo chown $USER /Library/WebServer/Documents /Library/WebServer/CGI-Executables
```

## 4. Munki installed

Munki can be downloaded here: https://github.com/munki/munki/releases

Install the package installer if you don't already have it.

### 4.5 Munki repo, packages

Create a munki repo:

```bash
mkdir -p ~/munki/{pkgs,pkgsinfo,catalogs,manifests}
```

Place an example pkginfo into the `pkgsinfo` directory (after Munki installed).

```bash
/usr/local/munki/makepkginfo -f /Applications/Safari.app --nopkg --name Safari > ~/munki/pkgsinfo/Safari-test.pkginfo
```

## 5. Python virtualenv installed

Install virtualenv on your Mac:

```bash
sudo easy_install virtualenv
```

## 6. A Python virtualenv at the ready with Flask installed

After virtualenv is installed, let's make a virtual environment:

```bash
virtualenv ~/flask-venv
source ~/flask-venv/bin/activate
pip install Flask
```

# All set!
