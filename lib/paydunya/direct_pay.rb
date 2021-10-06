module Paydunya
  class DirectPay < Paydunya::Checkout::Core
    def credit_account(account_alias, amount, withdraw_mode = nil)
      payload = {
        account_alias: account_alias,
        amount: amount,
        withdraw_mode: withdraw_mode
      }

      result = send_post_request(Paydunya::Setup.direct_pay_credit_base_url, payload)
      push_results(result)
      result['response_code'] == '00'
    end
  end
end
