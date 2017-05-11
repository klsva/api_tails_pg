class ApplicationController < ActionController::API
  include ActionController::Serialization
  #Обработка стандартной ошибки запроса к базе данных:
  rescue_from ActiveRecord::RecordNotFound do
    render json: { error: 'No such record in Database; check params',
                   status: :not_found,
    }
  end

  #Для перехватывания ошибок отсутствия или несовпадения маршрутов (routes)
  #необходимо организовать выполнение метода, который заменял бы
  # стандартный трекинг ошибки вида Routing Error.
  # Тогда при некорректном запросе в браузере - вместо стандартного
  # трекинга ошибки вида  Routing Error в браузере отобразится кастомный json,
  # дающий в API информацию о причине exception

  def catch_404
    raise ActionController::RoutingError.new(params[:path])
  end

  rescue_from ActionController::RoutingError do |exception|
    logger.error "Routing error occurred: #{exception}"
    # render plain: '404 Not found', status: 404
    render json: { error: 'No route matches; check routes',
                   status: :no_route,
    }
  end



end
