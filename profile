# Set environment variables
. ~/.environ
. ~/.environ.private

# Source Bash-specific config if running Bash
if [ "$BASH" ] && [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi
