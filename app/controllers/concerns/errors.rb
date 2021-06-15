module Errors
  UNAUTHORIZED = 401
  UNAUTHORIZED_MESSAGE = 'Invalid unauthorized'

  REQUIRED_NAME = 'requiredName'
  REQUIRED_NAME_MESSAGE = 'Invalid portfolio name should be exists'
  INVALID_ACCESS_TOKEN = 'Invalid Access Token'

  INVALID_REQUEST = 400
  INVALID_REQUEST_MESSAGE = 'Invalid Request'
  INVALID_REQUEST_LIMIT_MESSAGE = 'Invalid Request over limit'
  INVALID_REQUEST_DUPLICATED_MESSAGE = 'Invalid Request duplicated'

  INVALID_USER_ID_MESSAGE = 'Invalid user id'

  INVALID_EXIST = 400
  INVALID_EXIST_MESSAGE = 'Invalid Exist'
  INVALID_EXIST_TICKER_SYMBOL = 'Invalid Ticker Symbol Exist'

  FORBIDDEN = 403

  NOT_FOUND = 404
  NOT_FOUND_MESSAGE = 'Not found Item'

  OPERATION_ERROR = 500
  OPERATION_ERROR_MESSAGE = 'Operation Error'

  def self.gql_error!(error_code, error_message)
    raise GraphQL::ExecutionError.new(error_message, extensions: {
      code: error_code
    })
  end
end