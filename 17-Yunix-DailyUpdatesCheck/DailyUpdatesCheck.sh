#!/bin/bash

>/root/17-Yunix-DailyUpdatesCheck/`date +%d-%a-%b-%y`.txt

yum update >> /root/17-Yunix-DailyUpdatesCheck/`date +%d-%a-%b-%y`.txt && chmod 750 /root/17-Yunix-DailyUpdatesCheck/`date +%d-%a-%b-%y`.txt
