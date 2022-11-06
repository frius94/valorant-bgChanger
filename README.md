# Valorant Background Changer
A powershell script to change your Valorant background easily.<br>
Youtube video: https://www.youtube.com/watch?v=i0rvNfKdxAQ

## How to use it
1. Download the **bgChanger.ps1** script. 
2. Make sure your Riot-Games Client is running (not Valorant!)
3. Run **bgChanger.ps1** with "right-click -> Run with PowerShell".

## Limitation
This script only works on Windows machines and only with mp4 files.<br> 
It won't work on macOS or any Linux OS.

## How does it work?
1. It checks if the client is running, because normally on every client startup the video files get reset.<br>
2. You are asked to select the mp4 file.
3. The mp4 file gets copied to the path **Riot Games\VALORANT\live\ShooterGame\Content\Movies\Menu** where the default mp4 files are located.
4. If the script fails to locate your Valorant installation path, you are asked to select the VALORANT folder, and it will try to copy again.

## Contributing
If you have a suggestion that would make this better, please fork the repo and create a pull request.
1. Fork the Project
2. Create your Feature Branch (git checkout -b feature/AmazingFeature)
3. Commit your Changes (git commit -m 'Add some AmazingFeature')
4. Push to the Branch (git push origin feature/AmazingFeature)
5. Open a Pull Request
