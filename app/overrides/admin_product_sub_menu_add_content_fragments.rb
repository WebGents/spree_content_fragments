# Add the 'Content Fragments' link to the product sidebar in the admin panel
Deface::Override.new(
  name:          File.basename(__FILE__, '.rb'),
  virtual_path:  'spree/admin/shared/_product_tabs',
  insert_bottom: 'ul',
  text:          <<-ERB
  <%= content_tag :li, class: ('active' if current == :content_fragments) do %>
    <%= link_to_with_icon 'tasks', Spree.t(:content_fragments), spree.admin_product_content_fragments_url(@product) %>
  <% end if can?(:admin, Spree::Product) %>
  ERB
)
