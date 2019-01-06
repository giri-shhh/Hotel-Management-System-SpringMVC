package com.capgemini.web.hms.exception;

@SuppressWarnings("serial")
public class HMSException extends Exception {

	public HMSException() {
	}

	public HMSException(String message) {
		super(message);
	}

	public HMSException(Throwable cause) {
		super(cause);
	}

	public HMSException(String message, Throwable cause) {
		super(message, cause);
	}

	public HMSException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
		super(message, cause, enableSuppression, writableStackTrace);
	}

}
