#!/bin/bash


#Build aab
# 1.4.5+25
current_tag="1.9.2+31"
next_tag="1.9.3+32"
FLUTTER_BUILD_NAME="1.9.31"
NEW_FLUTTER_BUILD_NAME="1.9.32"

sed -i '' "s/$current_tag/$next_tag/" pubspec.yaml
next_tag=$(cat pubspec.yaml | grep version: | awk '{print $2}')
echo New tag is: $next_tag

read -p "Press Enter to continue"

cp ~/_zync/meir/key.properties android/app/

cp ~/_zync/meir/upload-keystore.jks play

vi android/app/build.gradle #and put in passwords

# Get current FLUTTER_BUILD_NAME from iOS project file
CURRENT_FLUTTER_BUILD_NAME=$(grep "FLUTTER_BUILD_NAME" ios/Runner.xcodeproj/project.pbxproj | head -1 | sed 's/.*FLUTTER_BUILD_NAME = \([^;]*\);.*/\1/')
echo "Current FLUTTER_BUILD_NAME: $CURRENT_FLUTTER_BUILD_NAME"
echo "New FLUTTER_BUILD_NAME: $NEW_FLUTTER_BUILD_NAME"

# Replace the FLUTTER_BUILD_NAME in iOS project file
sed -i '' "s/FLUTTER_BUILD_NAME = $CURRENT_FLUTTER_BUILD_NAME/FLUTTER_BUILD_NAME = $NEW_FLUTTER_BUILD_NAME/g" ios/Runner.xcodeproj/project.pbxproj
grep "FLUTTER_BUILD_NAME" ios/Runner.xcodeproj/project.pbxproj

read -p "Press Enter to continue"

flutter build appbundle
if [ $? -ne 0 ]; then
    echo "flutter build appbundle failed"
    exit 1
fi

cp build/app/outputs/bundle/release/app-release.aab ~/meir-appbundle/app-release-$next_tag.aab

rm play/upload-keystore.jks
rm android/app/key.properties
git checkout android/app/build.gradle
git add .
git commit -m "bump version to $next_tag"
git tag $next_tag
git push origin $next_tag
git push
if [ $? -eq 0 ]; then
	echo All done B\"H
else
	echo Error mmm...
	exit 1
fi


#Play webUI Production new release, upload app-release-x.y.z+12.aab
#Next
#This App Bundle contains native code, and you've not uploaded debug symbols. We recommend you upload a symbol file to make your crashes and ANRs easier to analyze and debug. Learn More = Ignore.
# Save
# Go to overview
# Send 1 change fo review
# Send changes to review

# App bundle explorer


# # Data flow
# pd2sqlite
# check_links
# series_new


# # Android splash
# cd android
# cp /Users/ubuntu/splash.png /Users/ubuntu/meirb/android/app/src/main/res/mipmap-mdpi/launcher_icon.png
# cp /Users/ubuntu/splash.png /Users/ubuntu/meirb/android/app/src/main/res/mipmap-hdpi/launcher_icon.png
# cp /Users/ubuntu/splash.png /Users/ubuntu/meirb/android/app/src/main/res/mipmap-xxxhdpi/launcher_icon.png
# cp /Users/ubuntu/splash.png /Users/ubuntu/meirb/android/app/src/main/res/mipmap-xxhdpi/launcher_icon.png
# cp /Users/ubuntu/splash.png /Users/ubuntu/meirb/android/app/src/main/res/mipmap-xhdpi/launcher_icon.png
