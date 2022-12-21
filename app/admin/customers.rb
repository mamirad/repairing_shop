ActiveAdmin.register Customer do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :email, :phone, :city, :address, :cnic_no
  filter :name
  filter :email
  filter :phone
  index do
    selectable_column
    id_column
    column :name
    column :email
    column :phone

    actions
  end

  show do
    columns do
      column class: 'column width-30' do
        default_main_content
      end

      column class: 'column width-67' do
        panel "#{customer.name}'s Items" do
          table_for customer.customer_items.includes(:item) do
            column :name do |customer_item|
              customer_item.item.name
            end

            column :model do |customer_item|
              customer_item.item.model
            end

            column :brand do |customer_item|
              customer_item.item.brand
            end

            column :iemi do |customer_item|
              customer_item.item.iemi
            end

            column :status do |customer_item|
              customer_item.status.humanize
            end

            column :action do |customer_item|
              span link_to 'view', admin_item_path(customer_item.item.id), class: 'btn btn-xs btn-default'
              span link_to 'edit', edit_admin_item_path(customer_item.item.id)
              span link_to 'delete', admin_item_path(customer_item.item.id), method: :delete, :data => { :confirm => 'Are you sure?' }
            end
          end
        end
      end

    end
  end
  # sidebar "Details", only: :show do
  #   attributes_table_for customer do
  #     row :name
  #     # row :author
  #     # row :publisher
  #     # row('Published?') { |b| status_tag b.published? }
  #   end
  # end

  controller do
  end
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :email, :phone, :city, :address, :cnic_no]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
