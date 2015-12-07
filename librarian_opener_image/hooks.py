from bottle_utils.i18n import lazy_gettext as _

from .opener import image_opener


def initialize(supervisor):
    supervisor.exts.openers.register('image',
                                     label=_("View"),
                                     route=image_opener,
                                     content_type='image')
