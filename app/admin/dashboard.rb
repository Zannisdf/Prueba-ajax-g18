ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    columns do
      column do
        panel 'Users' do
          ul do
            li "Number of users: #{User.count}"
          end
        end
      end

      column do
        panel 'Companies' do
          ul do
            li "Number of companies: #{Company.count}"
          end
        end
      end

      column do
        panel 'Complaints' do
          ul do
            li "Number of complaints: #{Complaint.count}"
          end
        end
      end
    end
  end # content
end
