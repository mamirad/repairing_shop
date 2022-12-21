ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    

    # Here is an example of a simple dashboard with columns and panels.

    columns do
      column do
        panel "Customer(s)" do
          h1 Customer.count
        end
      end
      column do
        panel "Item(s)" do
          h1 Item.count
        end
      end
      column do
        panel "Item in Hand" do
          h1 CustomerItem.item_in_hand.count
        end
      end
      column do
        panel "In Progress" do
          h1 CustomerItem.in_progress.count
        end
      end
      column do
        panel "repaired" do
          h1 CustomerItem.repaired.count
        end
      end

      column do
        panel "delivered" do
          h1 CustomerItem.delivered.count
        end
      end
    end
  end # content
end
