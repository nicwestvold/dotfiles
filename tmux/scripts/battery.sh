#!/usr/bin/env bash
pmset -g batt 2>/dev/null | grep -Eo '[0-9]+%' | head -1
