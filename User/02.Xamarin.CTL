#TITLE=02.Xamarin
#INFO
New Cliptext library
#SORT=n

#T=Xamarin Download
<?xml version="1.0" encoding="utf-8"?>
<updates>
<Global>
	<WelcomeUrl>http://xamarin.com/welcome</WelcomeUrl>
</Global>
<Update>
	<Name>Java JDK</Name>
	<GenericName>JDK</GenericName>
	<Version>1.6</Version>
	
	<UpdateVersion>39</UpdateVersion>
	
	<IncompatibleVersions>
		<ge>1.7.0.0</ge>
	</IncompatibleVersions>
	<Url>http://download.xamarin.com/Installer/MonoForAndroid/jdk-6u39-windows-i586.exe</Url>

	<ManualInstructions>
<Para>Download the <Link handler="variable" target="Url"><Name /> v<Version/> installer</Link> to any directory on your disk, double-click the downloaded file and follow the on-screen instructions.</Para>
<Para><Note>It is <Bold>very important</Bold> to install the 32-bit version of <Name/> even if you're using 64-bit Windows. It is also important that <Name/> v1.6 is installed (although it is fine to have
<Name/> 1.7 or newer installed at the same time)</Note></Para>
	</ManualInstructions>
</Update>
<Update Long="true">
	<Name>Android SDK</Name>
	<Version>22</Version>
	<GenericName>ASDK</GenericName>
	<Url>http://dl.google.com/android/installer_r22-windows.exe</Url>
	<RepositoryUrl>http://dl.google.com/android/repository/repository-10.xml</RepositoryUrl>
	<RepositoryNS>http://schemas.android.com/sdk/android/repository/10</RepositoryNS>
	<Platforms>7,8,10,12,15,19</Platforms>
	<Samples></Samples>
	<DownloadDocs>false</DownloadDocs>
	<ManualInstructions>
<Optional if="NeedMainSDK"><Para>Download the <Link handler="variable" target="Url"><Name/> for Windows version <Version/></Link> to any directory on your disk and double-click it to start main SDK installation process. You
can install the SDK either system wide or only for your account. You will need to point your IDE to that location after the installation is completed.</Para></Optional>
<Para><Link handler="exec" target="SdkManager">Click here</Link> in order to start the Android SDK Manager application. In the GUI make sure the following components are installed or selected for installation:
<List type="ul">
	<ListItem>Android SDK Tools</ListItem>
	<ListItem>Android SDK Platform-tools</ListItem>
	<ListItem>Android SDK Build-tools</ListItem>
	<Repeat for="Platforms" format="csl">
		<ListItem>Android API <RepeatItem/></ListItem>
	</Repeat>
</List>
</Para>
<Para>Once all the required components are selected (you can select others as well, if you wish) start the installation. <Link handler="file" target="TargetDir">Click here to open target dir</Link></Para>
<Optional if="NeedNDK"><Para>Download the <Link handler="variable" target="NDKUrl">Android NDK for Windows version <NDKVersion/></Link> to any directory on your disk and double-click it to start the NDK installation.</Para></Optional>
<Para>When the <Name/> installation is finished you might want to start the <Link handler="exec" target="AvdManager">Android Emulator Manager</Link> and create as many emulator images as you
might need for your development. This step can be performed at any time, on an as-needed basis.</Para>
	</ManualInstructions>
	<NDK>
		<Version>8</Version>
		<VersionTag>d</VersionTag>
		<Url>http://dl.google.com/android/ndk/android-ndk-r8d-windows.zip</Url>
		<TargetDir>|ProgramFiles|\Android\ndk</TargetDir>
	</NDK>
	<AVD>
		<Name>MonoForAndroid API 15</Name>
		<BasePlatform>15</BasePlatform>

		<SdCardSize>512</SdCardSize>
		<SkinName>QVGA</SkinName>

		<RamSize>512</RamSize>


		<LcdDensity>120</LcdDensity>
		<HeapSize>48</HeapSize>
	</AVD>
	<AVD>
		<Name>MonoForAndroid API 14</Name>
		<BasePlatform>14</BasePlatform>
		<SdCardSize>512</SdCardSize>
		<SkinName>QVGA</SkinName>
		<RamSize>512</RamSize>
		<LcdDensity>120</LcdDensity>
		<HeapSize>48</HeapSize>
	</AVD>
	<AVD>
		<Name>MonoForAndroid API 12</Name>
		<BasePlatform>12</BasePlatform>
		<SdCardSize>512</SdCardSize>
		<SkinName>WXGA</SkinName>
		<RamSize>512</RamSize>
		<HeapSize>48</HeapSize>
		<LcdDensity>160</LcdDensity>
		<KeyboardLid>false</KeyboardLid>
	</AVD>
	<AVD>
		<Name>MonoForAndroid API 10</Name>
		<BasePlatform>10</BasePlatform>
		<SdCardSize>512</SdCardSize>
		<SkinName>QVGA</SkinName>
		<RamSize>512</RamSize>
		<HeapSize>32</HeapSize>
		<LcdDensity>120</LcdDensity>
	</AVD>
</Update>
<Update>
	<Name>GTK#</Name>
	<Version>2.12.25</Version>
	<GenericName>GTKSHARP</GenericName>
	<Url>http://download.xamarin.com/GTKforWindows/Windows/gtk-sharp-2.12.25.msi</Url>
	<RequiresAdminRights>true</RequiresAdminRights>
	<ManualInstructions>
<Para>Download the <Link handler="variable" target="Url"><Name /> v<Version/> installer</Link> to any directory on your disk, double-click the downloaded file and follow the on-screen instructions.</Para>
	</ManualInstructions>
</Update>
<Update>
	<Name>Xamarin Studio</Name>
	<Version>5.5.3</Version>
	<ReleaseId></ReleaseId>
	<GenericName>MonoDevelop</GenericName>
	<Url>http://download.xamarin.com/studio/Windows/XamarinStudio-5.5.3.6-0.msi</Url>
	<RequiresAdminRights>false</RequiresAdminRights>
	<ManualInstructions>
<Para>Download the <Link handler="variable" target="Url"><Name/> v<Version/> installer</Link> to any directory on your disk, double-click it and follow the on-screen instructions.</Para>
	</ManualInstructions>
</Update>
<Update Selectable="false">
    <Name>Xamarin</Name>
    <Version>3.7.248</Version>
    <GenericName>XVS</GenericName>
    <DependsOn>JDK,ASDK,GTKSHARP,MonoDevelop</DependsOn>
    <Disables>XAndroid,MTVS</Disables>
    <Url>http://download.xamarin.com/XamarinforVisualStudio/Windows/Xamarin.VisualStudio_Setup-3.7.248.msi</Url>
    <RequiresAdminRights>true</RequiresAdminRights>
	<ManualInstructions>
<Para>Download the <Link handler="variable" target="Url"><Name/> v<Version/> installer</Link> to any directory on your disk, double-click it and follow the on-screen instructions.</Para>
<Note>After installation, restart your Windows workstation to make sure all of the installed system services are running.</Note>
	</ManualInstructions>
</Update>

<ManualInstructionsIntro>
   <Para><Note>It was not possible to complete an automatic installation.  This might be due to a problem with your network, proxy servers or an unsolvable installation conflict.    At this point, you can continue the installation by manually downloading and installing the independent pieces.   The list below shows each component that you need to install.</Note></Para>
</ManualInstructionsIntro>
<ManualInstructionsStyleSheet>
<![CDATA[
body {
  font-size: 10pt;
  font-family: sans-serif;
  color: black;
}

.monospace {
  font-family: monospace;
}

.executableName, .fsLocation {
  font-family: monospace;
  font-weight: bold;
}

.shellCode {
  display: block;
  font-family: monospace;
  margin-left: 5em;
  margin-right: 5em;
  margin-top: 1em;
  margin-bottom: 1em;
  padding: 0.5em;
  border: darkgray 1px dotted;
}

.note {
  display: block;
  font-size: 11pt;
  background-color: lightgray;
  color: darkred;
  padding: 10px;
  border: gray 1px solid;
  margin-left: 5em;
  margin-right: 5em;
  margin-top: 1em;
  margin-bottom: 1em;
}

.item {
  margin-top: 1em;
  border-top: darkgray 1px solid
}

.itemTitle {
  background-color: #eeeeee;
  font-size: 12pt;
  font-weight: bold;
  margin-bottom: 0.5em;
}
]]>
</ManualInstructionsStyleSheet>
</updates>

#