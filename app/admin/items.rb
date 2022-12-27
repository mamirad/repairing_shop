ActiveAdmin.register Item do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :model, :brand, :iemi, :issue, :status
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :model, :brand, :iemi]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  collection_action :track, method: :get
  member_action :receipt, method: :get
  
  controller do
    def track
      @item = Item.find_by(id: params[:id])
      if @item.present?
        redirect_to admin_item_path(@item)
      else
        redirect_to '/admin', alert: 'No Record found with this tracking ID'
      end
    end

    def receipt
      @item = Item.find(params[:id])
      respond_to do |format|
        format.pdf do
          render :pdf => "receipt for #{@item.name}"
        end
      end
    end
  end

  index do
    selectable_column
    id_column
    column :customer
    column :name
    column :status do |item|
      item.status.humanize
    end
    column :model
    column :brand
    column :iemi
    column :issue
    column :refer_source

    actions do |item|
      link_to 'Receipt', receipt_admin_item_path(item.id, format: :pdf)
    end
  end
end
