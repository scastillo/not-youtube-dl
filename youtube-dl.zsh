#compdef youtube-dl

__youtube_dl() {
    local curcontext="$curcontext" fileopts diropts cur prev
    typeset -A opt_args
    fileopts="--download-archive|-a|--batch-file|--load-info|--cookies"
    diropts="--cache-dir"
    cur=$words[CURRENT]
    case $cur in
        :)
            _arguments '*: :(::ytfavorites ::ytrecommended ::ytsubscriptions ::ytwatchlater ::ythistory)'
        ;;
        *)
            prev=$words[CURRENT-1]
            if [[ ${prev} =~ ${fileopts} ]]; then
                _path_files
            elif [[ ${prev} =~ ${diropts} ]]; then
                _path_files -/
            elif [[ ${prev} == "--recode-video" ]]; then
                _arguments '*: :(mp4 flv ogg webm mkv)'
            else
                _arguments '*: :(--help --version --update --ignore-errors --abort-on-error --dump-user-agent --list-extractors --extractor-descriptions --proxy --socket-timeout --default-search --ignore-config --flat-playlist --playlist-start --playlist-end --match-title --reject-title --max-downloads --min-filesize --max-filesize --date --datebefore --dateafter --min-views --max-views --no-playlist --age-limit --download-archive --include-ads --rate-limit --retries --buffer-size --no-resize-buffer --test --batch-file --id --auto-number --output --autonumber-size --restrict-filenames --title --literal --no-overwrites --continue --no-continue --no-part --no-mtime --write-description --write-info-json --write-annotations --write-thumbnail --load-info --cookies --cache-dir --no-cache-dir --rm-cache-dir --quiet --no-warnings --simulate --skip-download --get-url --get-title --get-id --get-thumbnail --get-description --get-duration --get-filename --get-format --dump-json --dump-single-json --newline --no-progress --console-title --verbose --dump-intermediate-pages --write-pages --youtube-print-sig-code --print-traffic --encoding --no-check-certificate --prefer-insecure --user-agent --referer --add-header --bidi-workaround --format --all-formats --prefer-free-formats --max-quality --list-formats --youtube-include-dash-manifest --youtube-skip-dash-manifest --write-sub --write-auto-sub --all-subs --list-subs --sub-format --sub-lang --username --password --twofactor --netrc --video-password --extract-audio --audio-format --audio-quality --recode-video --keep-video --no-post-overwrites --embed-subs --embed-thumbnail --add-metadata --xattrs --prefer-avconv --prefer-ffmpeg --exec)'
            fi
        ;;
    esac
}

__youtube_dl