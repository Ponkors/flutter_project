abstract class SubmitStatusForm {
  const SubmitStatusForm();
}

class InitSubmitStatus extends SubmitStatusForm {
  const InitSubmitStatus();
}
class SubmissionSuccess extends SubmitStatusForm {}
class SubmissionFailed extends SubmitStatusForm {
  final String? exception;
  SubmissionFailed(this.exception);
}
class FormSubmitting extends SubmitStatusForm {}