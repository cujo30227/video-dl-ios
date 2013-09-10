import youtube_dl

ydl_version = youtube_dl.__version__

class VideoDL(youtube_dl.YoutubeDL):
    def __init__(self, templ, hook):
        params = {
            'continuedl': True,
            'writeinfojson': True,
            'writethumbnail': True,
        }
        params.update({
            'outtmpl': templ,
        })
        super(VideoDL, self).__init__(params)
        self.add_default_info_extractors()
        self.fd.add_progress_hook(hook)
