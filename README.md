# Reproduction steps

```bash
docker build -t bug-reproduction:latest .
docker run --rm -it bug-reproduction:latest zsh

# Now inside the running container

echo 'a command so long it does not fit into the buffer of size 30'
echo 'a short command'

# CTRL+R to enter atuin
# Navigate to the long command
# Press <tab> or <right-arrow> to see the command plus the history entry before (`echo 'a short command'`) directly appended
# exit to exit the running docker container
exit
```
