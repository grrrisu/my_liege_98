at_exit do
  Rails.logger.info "stopping sim queues"
  SimLoopService.new.stop
  # WorldLockService.new.clear
  # Rails.logger.info 'locks cleared'
  # puts 'good bye'
end
