class SessionController < ApplicationController
  def index
  	@@process = Process.pid
  	sleep 3
  	if @@process != Process.pid
  		logger.info "The thread lock is broken !!!"
  		logger.info "current process is #{Process.pid}"
  	end
  end
end
