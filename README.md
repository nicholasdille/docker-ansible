# Usage

```bash
docker build --tag ansible:alpine .
alias ansible-playbook="docker run --rm --volume $PWD:/src --workdir /src ansible:alpine"
```
