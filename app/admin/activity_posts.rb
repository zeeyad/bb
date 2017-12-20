ActiveAdmin.register ActivityPost do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#

  scope :all
  scope :submitted
  scope :approved
  scope :rejected

  controller do
    def find_resource
      scoped_collection.friendly.find(params[:id])
    end
  end

  permit_params :title, :description, :user_id

  action_item :approved, only: :show do
   	link_to "Approved", approve_admin_activity_post_path(activity_post), method: :put if !activity_post.approved?
  end

  action_item :approved, only: :show do
   	link_to "Reject", reject_admin_activity_post_path(activity_post), method: :put if !activity_post.rejected?
  end

  member_action :approve, method: :put do
   	activity_post = ActivityPost.friendly.find(params[:id])
   	activity_post.update(status: 1)
   	redirect_to  admin_activity_post_path(activity_post)
  end

  member_action :reject, method: :put do
   	activity_post = ActivityPost.friendly.find(params[:id])
   	activity_post.update(status: 2)
   	redirect_to  admin_activity_post_path(activity_post)
  end
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

end
