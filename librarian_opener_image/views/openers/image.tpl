<div class="opener-main opener-image">
    % if meta:
    <script id="image-urls" type="application/json">
        {
            "urls": [
            % for image in meta['image']['album']:
                <% sep = ',' if not loop.last else '' %>
                "${h.quoted_url('files:direct', path=th.join(meta.path, image['file']))}"${sep}
            % endfor
            ]
        }
    </script>
    <div class="show-album">
        <%
            query = h.QueryDict()
            query.add_qparam(action='open', opener_id='image')
        %>
        <a class="back" href="${content_url + query.to_qs()}">Back</a>
    </div>
    % if img_index > 0:
    <div class="cell">
        <a class="previous" href="${content_url + h.set_qparam(opener_id='image').set_qparam(index=img_index - 1).to_qs()}">Prev</a>
    </div>
    % endif
    % endif
    <div class="cell image-container">
        <img src=${image_url} data-index="${img_index if meta else ''}" />
    </div>
    % if meta:
    % if img_index < img_count - 1:
    <div class="cell">
        <a class="next" href="${content_url + h.set_qparam(opener_id='image').set_qparam(index=img_index + 1).to_qs()}">Next</a>
    </div>
    % endif
    % endif
</div>
<script type="text/javascript" src="${assets['js/image']}"></script>
