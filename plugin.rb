# frozen_string_literal: true
# name: discourse-onebox-xinhuanet
# about: For generating pretty oneboxes for xinhuanet.com
# version: 0.1
# authors: dengzi
# https://opinion.huanqiu.com/article/9CaKrnKoXFA

Onebox = Onebox

module Onebox
    module Engine
      class HuanqiuOnebox
        include Engine
        # include LayoutSupport
        include HTML
  
        matches_regexp(/^(http?:\/\/)?(.*)?huanqiu\.com\/?.*\/?$/)

        def get_logo_url
          'https://rs1.solution9.net/api/source/huanqiu-releaseStatics/www.huanqiu.com/index/new_logo.png'
        end

      def to_html
          result =  {
            url: @url,
            image: get_logo_url,
            title: raw.css('title').text.gsub('\n', '').strip(),
            # description: raw.css('.l-container article p')[0].text
          }
  
				<<-HTML
				<aside class="onebox xinhuanet">
				  <header class="source">
				    <a href="#{@url}">huanqiu.com</a>
			  	</header>
				  <article class="onebox-body">
				  <div class="aspect-image" style="--aspect-ratio:270/377;">
					<img src="#{result[:image]}" class="thumbnail d-lazyload">
					</div>
			    	<h3>
				      <a href="#{@url}" target="_blank" rel="nofollow ugc noopener">
				        #{result[:title]}
				      </a>
				    </h3>
            <p>#{result[:description]}</p>
            </article>
           </aside> 
        HTML
        
			end
		end
end
