ActiveAdmin.register Item do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :model, :brand, :iemi
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :model, :brand, :iemi]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
