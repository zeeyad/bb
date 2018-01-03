class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    false
  end

  def show?
    scope.where(:id => record.id).exists?
  end

  def create?
    false
  end

  def new?
    create?
  end

  def update?
    false
    #return true if user_or_programme_leader
    return true if programmeleader?
    return true if user_creator && !post_approved?
  end

  def edit?
    update?
  end

  def destroy?
    false
  end

  def approve?
    false
    return true if programmeleader?    
  end

  def reject?
    false
    return true if programmeleader?
  end

  def scope
    Pundit.policy_scope!(user, record.class)
  end

  def admin_types
    ['ProgrammeLeader']
  end

  private

    def user_creator
      record.user_id == user.id
    end

    def programmeleader?
      admin_types.include?(user.type) 
    end

    def post_approved?
      record.approved?
    end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope
    end
  end
end
