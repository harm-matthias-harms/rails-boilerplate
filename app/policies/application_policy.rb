class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    false
  end

  alias_method :show?, :index?
  alias_method :create?, :index?
  alias_method :new?, :create?
  alias_method :update?, :index?
  alias_method :edit?, :update?
  alias_method :destroy?, :index?

  class Scope
    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      raise NotImplementedError, "You must define #resolve in #{self.class}"
    end

    private

    attr_reader :user, :scope
  end
end
