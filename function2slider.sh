#!/bin/bash
#sed -e 's/<Function .* Name\="\(.*\)" ID\="\(.*\)">//g'

touch dummy.sliders
i=0
j=0

cat test.qxw |grep "<Function" | while read line
do
name=`echo $line|sed -e 's/<Function .* Name\="\(.*\)" .*>/\1/g'`
functionid=`echo $line |sed -e 's/<Function .* ID\="\(.*\)">/\1/g'` #sed -e 's/<Function .* ID\="\(.*\)">/\1/g'`
pathname=`echo $name|cut -d " " -f1`
pathcolor=`echo $name|cut -d " " -f2`
pathsegment=`echo $name|cut -d " " -f4`

path="/"$pathname"/"$pathcolor"/Segment"$pathsegment
echo $path

pathchecksum=`./LAO $path`

echo '<Slider WidgetStyle="Knob" Caption="'$name'" InvertedAppearance="false">' >> dummy.sliders
echo '<WindowState Width="60" X="'$(echo "5+$i*60"|bc)'" Y="'$(echo "40+90*$j"|bc)'" Height="90" Visible="True"/>' >> dummy.sliders
echo '<Appearance>'>> dummy.sliders
echo '<FrameStyle>Sunken</FrameStyle>' >> dummy.sliders
echo '<ForegroundColor>Default</ForegroundColor>' >> dummy.sliders
echo '<BackgroundColor>Default</BackgroundColor>' >> dummy.sliders
echo '<BackgroundImage>None</BackgroundImage>' >> dummy.sliders
echo '<Font>Default</Font>' >> dummy.sliders
echo '</Appearance>' >> dummy.sliders
echo '<Input Universe="0" Channel="'$pathchecksum'"/>' >> dummy.sliders
echo '<SliderMode ValueDisplayStyle="Exact" ClickAndGoType="None">Playback</SliderMode>' >> dummy.sliders
echo '<Level HighLimit="255" LowLimit="0" Value="0"/>' >> dummy.sliders
echo '<Playback>' >> dummy.sliders
echo '<Function>'$functionid'</Function>' >> dummy.sliders
echo '</Playback>' >> dummy.sliders
echo '</Slider>' >> dummy.sliders

i=$(echo "$i+1"|bc)

if [ $i==9 ]
then
j=$(echo "$j+1"|bc)
i=0
fi

done
