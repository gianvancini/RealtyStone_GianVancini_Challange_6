module Sections
    class User_Services < SitePrism::Section

        # Menu de serviços
        element :open_new_account, '#leftPanel>ul>li:nth-child(1)>a'
        element :account_overview, '#leftPanel>ul>li:nth-child(2)>a'
        element :transfer_funds, '#leftPanel>ul>li:nth-child(3)>a'
        element :bill_pay, '#leftPanel>ul>li:nth-child(4)>a'
        element :find_transactions, '#leftPanel>ul>li:nth-child(5)>a'
        element :update_contact, '#leftPanel>ul>li:nth-child(6)>a'
        element :request_loan, '#leftPanel>ul>li:nth-child(7)>a'
        element :log_out, '#leftPanel>ul>li:nth-child(8)>a'
        element :right_panel, '#rightPanel'

        # Abrir nova conta
        element :account_type, '#type'
        element :account_sender, '#fromAccountId' 
        element :account_open_button, 'input[value="Open New Account"]'
        element :message_success, '#rightPanel>div>div>h1' 

        # Resumo das contas
        element :overview_account_one, '#accountTable>tbody>tr:nth-child(1)>td:nth-child(1)>a'
        element :overview_details, "#rightPanel>div>div:nth-child(1)>h1"

        # Transferir fundos
        element :transfer_amount, '#amount'
        element :transfer_from_account, "#fromAccountId"
        element :transfer_to_account, "#toAccountId"
        element :transfer_button, 'input[value="Transfer"]'
        element :div_success, 'div[ng-if="showResult"]'

        # Pagamentos
        element :payee_name, 'input[name="payee.name"]'
        element :payee_address, 'input[name="payee.address.street"]'
        element :payee_city, 'input[name="payee.address.city"]'
        element :payee_state, 'input[name="payee.address.state"]'
        element :payee_zip_code, 'input[name="payee.address.zipCode"]'
        element :payee_phone, 'input[name="payee.phoneNumber"]'
        element :payee_account, 'input[name="payee.accountNumber"]'
        element :payee_verify_account, 'input[name="verifyAccount"]'
        element :payee_amount, 'input[name="amount"]'
        element :payee_button, 'input[value="Send Payment"]'
        element :payee_success, 'div[ng-show="showResult"]'

        # Encontrar TRansaçoes
        element :find_select_account, '#accountId'
        element :find_by_id, '#criteria\.transactionId'
        element :find_button_by_id, '#rightPanel>div>div>form>div:nth-child(5)>button'
        element :find_by_date, '#criteria\.onDate'
        element :find_button_by_date, '#rightPanel>div>div>form>div:nth-child(9)>button'
        element :find_by_range_1, '#criteria\.fromDate'
        element :find_by_range_2, '#criteria\.toDate'
        element :find_button_by_range, '#rightPanel>div>div>form>div:nth-child(13)>button'
        element :find_by_amount, '#criteria\.amount'
        element :find_button_by_amount, '#rightPanel>div>div>form>div:nth-child(17)>button'

        # Atualizar contato
        element :update_first_name, '#customer\.firstName'
        element :update_last_name, '#customer\.lastName'
        element :update_address, '#customer\.address\.street'
        element :update_city, '#customer\.address\.city'
        element :update_state, '#customer\.address\.state'
        element :update_zip_code, '#customer\.address\.zipCode'
        element :update_phone, '#customer\.phoneNumber'
        element :update_button, 'input[value="Update Profile"]'

        # Emprestimo
        element :loan_amount, '#amount'
        element :loan_down, '#downPayment'
        element :loan_from_account, '#fromAccountId'
        element :loan_button, 'input[value="Apply Now"]'

    end
end
