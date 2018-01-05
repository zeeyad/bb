ActiveAdmin.register EventPost do

  batch_action :approve do |ids|
    batch_action_collection.find(ids).each do |eventpost|
      eventpost.approved!      
    end
    redirect_to collection_path, alert: "The posts have been approved."
  end

  batch_action :reject do |ids|
    batch_action_collection.find(ids).each do |eventpost|
      eventpost.rejected!      
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
   	link_to "Approved", approve_admin_event_post_path(event_post), method: :put if !event_post.approved?
  end

  action_item :approved, only: :show do
   	link_to "Reject", reject_admin_event_post_path(event_post), method: :put if !event_post.rejected?
  end

  member_action :approve, method: :put do
   	event_post = EventPost.friendly.find(params[:id])
   	event_post.update(status: 1)
   	redirect_to  admin_event_post_path(event_post), alert: "The posts have been approved."
  end

  member_action :reject, method: :put do
   	event_post = EventPost.friendly.find(params[:id])
   	event_post.update(status: 2)
   	redirect_to  admin_event_post_path(event_post), alert: "The posts have been rejected."
  end
  
end