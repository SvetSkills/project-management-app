class TenantfixController < Devise::SessionsController
  prepend_before_action :set_current_org

  def set_current_org
    current_account = Account.find(params[:account_id])
    ActsAsTenant.current_tenant = current_account
  end
end
