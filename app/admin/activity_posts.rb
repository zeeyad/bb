ActiveAdmin.register ActivityPost do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#

  batch_action :approve do |ids|
    batch_action_collection.find(ids).each do |activitypost|
      activitypost.approved!      
    end
    redirect_to collection_path, alert: "The posts have been approved."
  end

  batch_action :reject do |ids|
    batch_action_collection.find(ids).each do |activitypost|
      activitypost.rejected!      
    end
    redirect_to collection_path, alert: "The posts have been rejected."
  end

  index do
    selectable_column
    id_column
    column :title
    column :description
    column :start_date
    column :venue
    column :user
    column :status
    actions
  end

  filter :title
  filter :description
  filter :start_date
  filter :venue  

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
   	redirect_to  admin_activity_post_path(activity_post), alert: "The posts have been approved."
  end

  member_action :reject, method: :put do
   	activity_post = ActivityPost.friendly.find(params[:id])
   	activity_post.update(status: 2)
   	redirect_to  admin_activity_post_path(activity_post), alert: "The posts have been rejected."
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
