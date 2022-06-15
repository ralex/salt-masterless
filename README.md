# salt-masterless

Saltstack top file and states for my masterless setup.

## Bootstrap a masterless machine

```bash
curl https://raw.githubusercontent.com/ralex/salt-masterless/master/bootstrap.sh -o bootstrap.sh
chmod +x bootstrap.sh
./bootstrap.sh
```

## Documentation

|Repository|Content|
|---|---|
|`salt-masterless`|(This repository) Contains states to manage a masterless setup|
|[`salt-laptop`](https://github.com/ralex/salt-laptop)| Provides states for a work station setup|

Determining which state must be applied is based on `roles` grains applied on each machine.

For example, here is the file `/etc/salt/grains` on my personal computer:

```yaml
roles:
  - laptop
  - home
```

![Diagram](docs/diagram.svg)

*`salt-pillar` is a private git repository as it may contain sensitive informations.*

## Debugging

Add `test=True` on state.apply to print out potential changes before applying:
```bash
sudo salt-call state.apply test=True
```

The same apply on a specific state:
```bash
sudo salt-call state.apply <state> test=True
```

Display which states will be applied on the current machine:
```bash
sudo salt-call state.show_top
```

Print highstate (every state applied including the order in which it will be applied):
```bash
sudo salt-call state.show_highstate
```

Basically printing the same information as `show_highstate` but for a specific state:
```bash
sudo salt-call --local state.show_low_sls <state>
```
