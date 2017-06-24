module EnsureNewAccount
  extend ActiveSupport::Concern

  included do
    before_action :ensure_new_account, only: [:new, :create]

    def ensure_new_account
      redirect_to root_path if current_account.accountable
    end
  end
end
