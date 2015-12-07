import os

from bottle import request

from bottle_utils.html import quoted_url
from bottle_utils.i18n import i18n_url

from librarian_content.decorators import with_meta
from librarian_core.contrib.templates.renderer import view


@view('openers/album')
def album(path, meta, **kwargs):
    return dict(meta=meta, **kwargs)


@view('openers/image')
def image(path, meta, **kwargs):
    image_url = quoted_url('files:direct', path=path)
    return dict(image_url=image_url, meta=meta, **kwargs)


@with_meta(abort_if_not_found=False)
def image_opener(path, meta):
    if not meta:
        return image(path, meta=None)

    kwargs = dict(content_url=i18n_url('files:path', path=meta.path),
                  img_count=len(meta['image']['album']))
    try:
        img_index = int(request.params.get('index', None))
    except Exception:
        # no image index can be found or parsed, so show the whole album
        return album(path, meta, **kwargs)
    else:
        path = os.path.join(meta.path,
                            meta['image']['album'][img_index]['file'])
        return image(path, meta, img_index=img_index, **kwargs)
