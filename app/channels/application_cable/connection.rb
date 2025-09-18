module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_employee

    def connect
      set_current_employee || reject_unauthorized_connection
    end

    private
      def set_current_employee
        if current_employee.present?
          self.current_employee = current_employee
        end
      end
  end
end
