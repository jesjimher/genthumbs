genthumbs
=========

Generate thumbnails for images in current folder, according to FreeDesktop specification[1],
so they should be visible and usable to any standards-compliant software.
Specifically, any file browser should use these generated thumbs instead of re-generating its own.

Pre-generating your own thumbnails may be useful in certain scenarios, i.e.:

- Folders accessed through slow links, where thumbnail generation might be difficult or impossible
- Images distributed in read-only media (CD, DVD)
- Folders shared by several users, so to avoid every user generating their own set of thumbnails

Please note that genthumbs generates a static version of the thumbnails. If your images change often,
it may be better to stick to standard way of managing thumbnails (central, per-user repository of thumbnails,
usually located at ~/.thumbnails or similar). Particularly, you don't want to use genthumbs in these scenarios.

genthumbs depends on some third-party tools:

- md5sum
- Imagemagick (convert command)
- optipng

OptiPNG is not really needed, but it's highly recommended in order to optimize thumbnail size.
After all, the main reason to use thumbnails is saving space, so there's no point in having thumbnails 
bigger than necessary.

## See Also
* [thumbnailer](https://github.com/filcuc/thumbnailer) an app for creating thumbnails

[1] https://specifications.freedesktop.org/thumbnail-spec/thumbnail-spec-latest.html
