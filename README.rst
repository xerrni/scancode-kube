===========================
Helm3 Chart for ScanCode.io
===========================

Read more about ScanCode.io here: `scancodeio.readthedocs.io
<https://scancodeio.readthedocs.io/>`_.

Read more about Helm3 here: `helm.sh/docs
<https://helm.sh/docs/>`_.


Installation
============

Requires:

* Kubernetes cluster running with appropriate permissions (depending on your cluster)
* kubectl set up to connect to the cluster
* helm


Tested on:

* ``minikube``
 
  .. code-block::

      $ minikube version
      minikube version: v1.25.1
      commit: 3e64b11ed75e56e4898ea85f96b2e4af0301f43d

..
  * microk8s
    .. code-block::
      $ snap list microk8s
      Name      Version  Rev   Tracking     Publisher   Notes
      microk8s  v1.23.3  2948  1.23/stable  canonical✓  classic

..
  * ``kind`` (CI)

* ``helm``

  .. code-block::
  
    $ helm version
    version.BuildInfo{Version:"v3.8.0", GitCommit:"d14138609b01886f544b2025f5000351c9eb092e", GitTreeState:"clean", GoVersion:"go1.17.5"}

From repo root run:

.. code-block::

    $ helm install scancodeio ./


Contribute
==========

Issue tracker:

* GitHub issues

Code submissions:

* GitHub PR from your fork
* Check verification steps in `.github/workflows`


License
=======

* This project is licensed under the Apache 2.0 license.
* It depends on `Bitnami charts
  <https://github.com/bitnami/charts>`_ which is
  also licensed under Apache 2.0 license.
