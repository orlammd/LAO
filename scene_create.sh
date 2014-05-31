#!/bin/bash
Name=$1
FixtureID=$2
Channel=$3
Dimmer=$4
File=$5

echo '<Function Type="Scene" Name="'$Name'" ID="'$FunctionID'">'
echo '<Speed Duration="0" FadeOut="0" FadeIn="0"/>'
echo '<FixtureVal ID="'$FixtureID'">'$Channel','$Dimmer'</FixtureVal>'
echo '</Function>'
