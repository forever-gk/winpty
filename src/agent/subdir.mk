# Copyright (c) 2011-2015 Ryan Prichard
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to
# deal in the Software without restriction, including without limitation the
# rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
# sell copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
# FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
# IN THE SOFTWARE.

ALL_TARGETS += build/winpty-agent.exe

$(eval $(call def_mingw_target,agent,))

AGENT_OBJECTS = \
	build/agent/agent/Agent.o \
	build/agent/agent/ConsoleFont.o \
	build/agent/agent/ConsoleInput.o \
	build/agent/agent/ConsoleLine.o \
	build/agent/agent/DebugShowInput.o \
	build/agent/agent/DefaultInputMap.o \
	build/agent/agent/EventLoop.o \
	build/agent/agent/InputMap.o \
	build/agent/agent/LargeConsoleRead.o \
	build/agent/agent/NamedPipe.o \
	build/agent/agent/Terminal.o \
	build/agent/agent/Win32Console.o \
	build/agent/agent/main.o \
	build/agent/shared/Buffer.o \
	build/agent/shared/DebugClient.o \
	build/agent/shared/GenRandom.o \
	build/agent/shared/WindowsSecurity.o \
	build/agent/shared/WinptyAssert.o \
	build/agent/shared/WinptyVersion.o \
	build/agent/shared/winpty_snprintf.o \
	build/agent/shared/winpty_wcsnlen.o

build/winpty-agent.exe : $(AGENT_OBJECTS)
	@echo Linking $@
	@$(MINGW_CXX) $(MINGW_LDFLAGS) -o $@ $^

-include $(AGENT_OBJECTS:.o=.d)
