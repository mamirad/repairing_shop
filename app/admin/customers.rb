ActiveAdmin.register Customer do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :email, :phone, :city, :address, :cnic_no, items_attributes: [:name, :model, :brand, :iemi, :issue]
  filter :name
  filter :email
  filter :phone
  index do
    selectable_column
    id_column
    column :name
    column :email
    column :phone

    actions do |customer|
      link_to 'Receipt', receipt_admin_customer_path(customer.id, format: :pdf)
    end
  end

  show do
    columns do
      column class: 'column width-30' do
        default_main_content
      end

      column class: 'column width-67' do
        panel "#{customer.name}'s Items" do
          table_for customer.items do
            column :name do |item|
              item.name
            end

            column :model do |item|
              item.model
            end

            column :brand do |item|
              item.brand
            end

            column :iemi do |item|
              item.iemi
            end

            column :status do |item|
              item.status.humanize
            end

            column :action do |item|
              span link_to 'view', admin_item_path(item.id), class: 'btn btn-xs btn-default'
              span link_to 'edit', edit_admin_item_path(item.id)
              span link_to 'delete', admin_item_path(item.id), method: :delete, :data => { :confirm => 'Are you sure?' }
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
  member_action :receipt, method: :get
  controller do
    def new
      @customer = Customer.new
      @customer.items.build
    end

    def receipt
      @customer = Customer.find(params[:id])
      @items = Customer.find(params[:id]).items
      respond_to do |format|
        format.pdf do
          render :pdf => "receipt for #{@customer.name}"
        end
      end
    end
  end
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :email, :phone, :city, :address, :cnic_no]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  form do |f|
    f.inputs do
      f.input :name
      f.input :email
      f.input :phone
      f.input :city
      f.input :address
      f.input :cnic_no
    end
    f.inputs do
      f.has_many :items, heading: 'Item', allow_destroy: true, new_record: true do |item|
        item.input :name
        item.input :model
        item.input :brand
        item.input :iemi
        item.input :issue

      end
    end
    f.actions
  end
  
end
