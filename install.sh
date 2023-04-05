#!/bin/sh
git clone https://github.com/trailofbits/algo.git
sed -i '12i \  - one\n  - two\n  - three' ./algo/config.cfg
sed -i 's/no_log: true/no_log: false/g' ./algo/config.cfg
cd algo
sudo apt install -y --no-install-recommends python3-virtualenv
python3 -m virtualenv --python="$(command -v python3)" .env &&
  source .env/bin/activate &&
  python3 -m pip install -U pip virtualenv &&
  python3 -m pip install -r requirements.txt
./algo
