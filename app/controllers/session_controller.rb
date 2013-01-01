class SessionController < ApplicationController
	@@counter = 0
	@@threads = []
  
  def index
  	@@process = Process.pid

  	@@counter += 1
  	logger.info "Thread counter: #{@@counter} : #{@@process}"
  	@@threads << @@process unless @@threads.include?(@@process)
		logger.info "Threads: #{@@threads}"

  	sleep 1

  	if @@process != Process.pid
  		logger.info "The thread lock is broken !!!"
  		logger.info "current process is #{Process.pid}"
  	end
  end

  def test
    @@pid = $$
    sleep(1)
    logger.info "threads: #{$$}: #{@@pid}"
    logger.info "!!!!!!!!!!!!!!!!!!!!" unless @@pid == $$
  end
end
