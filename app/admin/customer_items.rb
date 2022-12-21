ActiveAdmin.register CustomerItem do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  filter :id, label: "Tracking ID"
  filter :customer
  filter :item

  scope :All, :default => true do
    CustomerItem.all
  end
  scope :item_in_hand, :default => true do
    CustomerItem.item_in_hand
  end

  scope :in_progress, :default => true do
    CustomerItem.in_progress
  end

  scope :repaired, :default => true do
    CustomerItem.repaired
  end

  scope :delivered, :default => true do
    CustomerItem.delivered
  end

  index do
    selectable_column
    column :id
    column :customer
    column :item
    column :status do |customer_item|
      customer_item.status.humanize
    end
    column :issue do |customer_item|
      customer_item.issue_details
    end
    column :refer_source do |customer_item|
      customer_item.refer_source
    end
    actions do |action|
      link_to 'PDF', receipt_admin_customer_item_path(action, format: :pdf)
    end
  end

controller do
  def receipt
    @customer_item = CustomerItem.find(params[:id])
    respond_to do |format|
      format.pdf { render(pdf: "receipt-#{@customer_item.id}.pdf") }
    end
  end
end
  
  permit_params :customer_id, :item_id, :status, :issue_details, :refer_source_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:customer_id, :item_id, :status, :issue_details, :refer_source_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
