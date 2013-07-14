

-module(file_mon).
-author("Martin Vejmelka <vejmelkam@gmail.com>").
-export([monitor-file/]).




% the file is not in use anymore and retries have run out
check_exit_conditions(true, File, Dev, T_ms, 0, DoneFunc, Targets) ->
    flow_util:multicast(eof, Targets);

check_exit_conditions(true, File, Dev, T_ms, RetriesLeft, DoneFunc, Targets) ->
    timer:sleep(T_ms),
    monitor_device(File, Dev, T_ms, RetriesLeft - 1, fun () -> true end, Targets);

check_exit_conditions(false, File, Dev, T_ms, ReriesLeft - 1, DoneFunc, Targets) ->
    timer:sleep(T_ms),
    monitor_device(File, Dev, T_ms, RetriesLeft, DoneFunc, Targets).

% monitor an open device for new data (sent to Targets)
monitor_device(File, Dev, T_ms, RetriesLeft, DoneFunc, Targets) ->
    case file:read_line(Dev) of
	{ok, L} ->
	    flow_util:multicast({line, L}, Targets),
	    monitor_device(File, Dev, T_ms, RetriesLeft, DoneFunc, Targets);
	eof ->
	    check_exit_conditions(DoneFunc(), File, Dev, T_ms, RetriesLeft, DoneFunc, Targets);
	{error, R} ->
	    Msg = io_lib:format("failed to watch file ~s with reason ~p", [File, R]),
	    flow_util:multicast({failure, Msg}, Targets)
    end.


% monitor the file file-name while checking whether writing to the file is considered done
% using DoneFunc and transmitting lines/eof messages to all targets
% when the file is closed, the monitor exits by itself
monitor_file(File, DoneFunc, Targets) ->
    case task_fsys:wait_for_file(File, 4000, 200) of
	{success, _File} ->
	    {pid, spawn(fun () -> {ok, Dev} = file:open(File, [read]),
				  monitor_device(File, Dev, 500, 2, DoneFunc, Targets),
				  file:close(Dev) end)};
	F -> F
    end.
			    
