# Copyright 2021 Alex Szakaly
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

@metrics
@prometheus

Feature: Prometheus Metrics
  As an administrator
  In order to track Certificate Signing Requests that kubelets use to serve TLS endpoints
  I need to be able to have metrics of Certificate Signing Request approvals

  Scenario: Application shall provide metrics related to Certificate Signing Request
    Given there is a running Pod in namespace "kubelet-serving-cert-approver" with label "app.kubernetes.io/name=kubelet-serving-cert-approver"
    Then the Pod shall provide Prometheus Metrics at "/metrics" endpoint at port 9090
    And metrics shall contain "kubelet_serving_cert_approver_invalid_certificate_signing_request_count" metric
    And metrics shall contain "kubelet_serving_cert_approver_approved_certificate_signing_request_count" metric
