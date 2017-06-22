# gsoc

Repo for my notes concerning mentoring for the Google Summer of Code.

# Repos:

Links to the students' repos:

- Leaderboard: https://github.com/saurabhima/gsoc_LEADERBOARD/
- Transcriber Qualification" https://github.com/rrajasek95/transcriber-qualification

# Pip3 Basics

Commands used to set up the virtual environments being used.

## Lessons Learned

Notes from `08-real_python_class/2017_01_24-Lesson_1/homework.txt`
(0.5 Summary) in the `always_learning_python` repo:

- virtualenv is outdated, use python3.6 -m venv instead
- Dashes in directory names cause errors in the virtual environments
- Be sure to use pip3 not pip

## Commands

### Create, etc.

Create, enter, and exit a new virtual env:

```
cd /var/www/gsoc/venvs
python3.6 -m venv transcriber_qualification.1
. transcriber_qualification.1/bin/activate
python    # Python 3.6.1+ (default, Jun  8 2017, 12:24:27)
deactivate
```

### Installing Requirements

Installing the required versions of supporting packages:

```
cd /var/www/gsoc/customizations/gsoc/venvs
. transcriber_qualification.1.sh
cd /var/www/gsoc/github/rrajasek95/transcriber-qualification
pip3 install -r requirements.txt
```

# Javascript Setup

Ensure `node` and `npm` are installed

```
node --version   # v4.2.6
npm --version    # 3.5.2
## Untested but should be ok (google for latest commands)
sudo apt-get install nodejs
installs nodejs
sudo apt-get install npm
```

## Install and Run `bower`

```
sudo npm install -g bower
bower install
```

## Setup the Javascript Files

```
sh ./static_setup.sh
```

# Run and Access App:

```
python run.py
```

- http://127.0.0.1:5000/login

