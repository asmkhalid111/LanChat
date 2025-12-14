#!/usr/bin/env python3

import sys
import smtplib
from email.mime.text import MIMEText
from email.mime.multipart import MIMEMultipart
from email.mime.base import MIMEBase
from email import encoders
import os

def send_email(sender_email, sender_password, recipient_email, subject, body, attachment_path=None):
    try:
        # Check if it's a Gmail/Google Workspace account
        if not sender_email.endswith('@gmail.com') and not sender_email.endswith('@diu.edu.bd'):
            print("Error: Email sending is currently only supported for Gmail and DIU (@diu.edu.bd) accounts.")
            return False
        
        # Create message
        msg = MIMEMultipart()
        msg['From'] = sender_email
        msg['To'] = recipient_email
        msg['Subject'] = subject

        # Add body
        msg.attach(MIMEText(body, 'plain'))

        # Add attachment if provided
        if attachment_path and os.path.isfile(attachment_path):
            with open(attachment_path, 'rb') as attachment:
                part = MIMEBase('application', 'octet-stream')
                part.set_payload(attachment.read())
                encoders.encode_base64(part)
                part.add_header('Content-Disposition', f"attachment; filename= {os.path.basename(attachment_path)}")
                msg.attach(part)

        # Connect to Gmail SMTP
        server = smtplib.SMTP('smtp.gmail.com', 587)
        server.starttls()
        server.login(sender_email, sender_password)
        text = msg.as_string()
        server.sendmail(sender_email, recipient_email, text)
        server.quit()

        print("Email sent successfully!")
        return True
    except smtplib.SMTPAuthenticationError as e:
        if "diu.edu.bd" in sender_email:
            print(f"Authentication failed for DIU email: {e}")
            print("DIU Google Workspace may have app passwords disabled.")
            print("Contact DIU IT Support: itsupport@daffodilvarsity.edu.bd or Ext-156")
            print("Request SMTP relay setup or app password enablement.")
        else:
            print(f"Authentication failed: {e}")
            print("Make sure you're using an app password if 2FA is enabled.")
            print("Generate app password at: https://myaccount.google.com/apppasswords")
        return False
    except Exception as e:
        print(f"Failed to send email: {e}")
        return False

if __name__ == "__main__":
    if len(sys.argv) < 6:
        print("Usage: python send_email.py <sender_email> <sender_password> <recipient_email> <subject> <body> [attachment_path]")
        sys.exit(1)

    sender_email = sys.argv[1]
    sender_password = sys.argv[2]
    recipient_email = sys.argv[3]
    subject = sys.argv[4]
    body = sys.argv[5]
    attachment_path = sys.argv[6] if len(sys.argv) > 6 else None

    success = send_email(sender_email, sender_password, recipient_email, subject, body, attachment_path)
    sys.exit(0 if success else 1)