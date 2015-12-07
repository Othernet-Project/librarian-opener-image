<div class="opener-main opener-album">
    <ul class="album">
    % for image in meta['image']['album']:
        <%
            thumb_path = image.get('thumbnail')
            if not thumb_path:
                thumb_path = image['file']
            thumb_url = h.quoted_url('files:direct', path=th.join(meta.path, thumb_path))
        %>
        <li class="album-item">
            <%
                query = h.QueryDict()
                query.add_qparam(action='open', opener_id='image', index=loop.index)
            %>
            <a href="${content_url + query.to_qs()}">
                <img class="thumbnail" src="${thumb_url}" />
                <span class="title">${image['title'] if image.get('title') else _('Image {} of {}').format(loop.index, img_count)}</span>
            </a>
        </li>
    % endfor
    </ul>
</div>
